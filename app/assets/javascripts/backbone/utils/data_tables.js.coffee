# DataTables のエラーを alert で表示しないようにする。
# ただし、$.fn.dataTableExt.sErrMode = 'throw' では $(document).ajaxError などが機能しなくなるので、
# _fnLog を書き換えて console.log でエラー内容を表示するようにする。
#
# (参考) Correctly Suppressing Warnings in DataTables?
# http://stackoverflow.com/questions/11941876/correctly-suppressing-warnings-in-datatables
$.fn.DataTable.ext.oApi._fnLog = (settings, level, msg, tn) ->
  msg = 'DataTables warning: ' +
    (if settings? then "table id=#{settings.sTableId} - " else '') +
    msg

  if (tn)
    msg += '. For more information about this error, please see ' +
      'http://datatables.net/tn/' +
      tn

  console.log(msg)

@App.module 'Utils.DataTables', (DataTables, App, Backbone, Marionette, $, _) ->

  DataTables.show = (element, options={}) ->
    $element = $(element)

    defaultOptions =
      processing: true
      serverSide: true
      responsive:
        details:
          renderer: (api, rowIdx) ->
            data = api.cells(rowIdx, ':hidden').eq(0).map (cell) ->
              $header = $(api.column(cell.column).header())
              text = $header.text() || ''
              data = api.cell(cell).data() || ''

              JST['backbone/templates/utils/data_tables/detail']
                text: text
                data: data

            data = data.join('')

            if data
              $('<table>').append(data)
            else
              false

      lengthMenu: [[5, 10, 15, 20, -1], [5, 10, 15, 20, '全て']]
      dom: """
        <'row'<'col-xs-12 col-sm-6'l><'col-xs-12 col-sm-6'f>r>
        t
        <'row'<'col-xs-12 col-md-5'i><'col-xs-12 col-md-7'p>>
      """
      ajax: $element.data('source')
      pagingType: 'simple_numbers'
      language:
        emptyTable:     I18n.t('js.dataTables.language.emptyTable')
        info:           I18n.t('js.dataTables.language.info')
        infoEmpty:      I18n.t('js.dataTables.language.infoEmpty')
        infoFiltered:   I18n.t('js.dataTables.language.infoFiltered')
        infoPostFix:    I18n.t('js.dataTables.language.infoPostFix')
        thousands:      I18n.t('js.dataTables.language.thousands')
        lengthMenu:     I18n.t('js.dataTables.language.lengthMenu')
        loadingRecords: I18n.t('js.dataTables.language.loadingRecords')
        processing:     "<i class='fa fa-spinner fa-spin'></i> #{I18n.t('js.dataTables.language.processing')}"
        search:         I18n.t('js.dataTables.language.search')
        zeroRecords:    I18n.t('js.dataTables.language.zeroRecords')
        paginate:
          first:    I18n.t('js.dataTables.language.paginate.first')
          last:     I18n.t('js.dataTables.language.paginate.last')
          next:     I18n.t('js.dataTables.language.paginate.next')
          previous: I18n.t('js.dataTables.language.paginate.previous')
        aria:
          sortAscending:  I18n.t('js.dataTables.language.aria.sortAscending')
          sortDescending: I18n.t('js.dataTables.language.aria.sortDescending')

      # (参考) Customizing the "Processing.." message
      # http://datatables.net/forums/discussion/6027/customizing-the-processing-message
      #
      # Ajax による通信時間は一瞬でマスク表示がちらつくので
      # 現状はローディングマスクは表示しないことにする。
      #
      # preDrawCallback: ->
      #   App.Utils.BlockUI.mask()
      # drawCallback: ->
      #   setTimeout ->
      #     App.Utils.BlockUI.unmask()

    # _.extend ではオプションが再帰的に merge されないので、_.merge を使う。
    # (参考) Recursive extend in Underscore.js?
    # http://stackoverflow.com/questions/14843815/recursive-extend-in-underscore-js
    table = $element.DataTable(_.merge(defaultOptions, options))

    _.extend table,
      reloadWithoutPaging: ->
        @ajax.reload(null, false)

    table
