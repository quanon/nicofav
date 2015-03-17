# search というクラスメソッド名は競合しやすい (実際に acts-as-messageable とぶつかる) ので、
# エイリアスとして用意されている ransack メソッドのみを利用する。
# (参考) https://github.com/activerecord-hackery/ransack#ransack-search-method
Ransack::Adapters::ActiveRecord::Base.class_eval('remove_method :search')
