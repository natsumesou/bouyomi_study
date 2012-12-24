Bouyomi.controllers do
  get :index do
    bouyomi = BouyomiDic.new Conf::App[:bouyomi]['base_dir']
    study_list = bouyomi.list_by_dic :ReplaceStudy
    render :erb, :index, layout: "/layouts/index", locals: {study_list: study_list}
  end
end
