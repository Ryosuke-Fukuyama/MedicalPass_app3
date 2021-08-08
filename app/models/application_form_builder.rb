class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  attr_reader :vue_data

  def initialize(object_name, object, template, options)
    super(object_name, object, template, options)

    # Vue の初期化時に渡すデータを保持するハッシュ
    @vue_data = {}
  end

  def select_vue(method, choices = [], options = {}, html_options = {}, &block)
    html_options = inject_vmodel(method, html_options)
    select(method, choices, options, html_options, &block)
  end

  # ... 必要な分だけ xxx_vue ヘルパーを作成する ...

  def inject_vmodel(method, html_options)
    # xxx_vue ヘルパーで参照されたデータを保持しておく
    @vue_data[method] = object[method]

    # 与えられた属性名と同じ値を `v-model` にも指定する
    html_options.merge('v-model': method)
  end
end