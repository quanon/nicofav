@App.module 'Utils.Validation', (Validation, App, Backbone, Marionette, $, _) ->

  errorClass = 'has-error text-danger'

  Validation.bind = (view, options = {}) ->
    prefix = options?.prefix || '.js-'

    Backbone.Validation.bind view,
      valid: (view, attr, selector) ->
        $formControl = view.$("#{prefix}#{attr}")
        Validation.removeError($formControl)
     
      invalid: (view, attr, error, selector) ->
        $formControl = view.$("#{prefix}#{attr}")
        Validation.removeError($formControl)
        Validation.addError($formControl, error)

  Validation.addError = ($formControl, errorMessage) ->
    $formGroup = $formControl.parents('.form-group')
    $formGroup.addClass(errorClass)
    $errorMessage = $(
      JST['backbone/templates/utils/validation/error_message']
        text: errorMessage
    )
    $errorMessage.insertAfter($formControl)

  Validation.removeError = ($formControl) ->
    $formGroup = $formControl.parents('.form-group')
    $formGroup.removeClass(errorClass)
    $formGroup.find('.error-message').remove()
