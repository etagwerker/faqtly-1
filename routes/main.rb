# encoding: utf-8
class Faqtly < Sinatra::Application
  get '/' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/about' do
    haml :about, layout: :'layouts/application'
  end

  get '/questions' do
    @questions = Question.all
    haml :'questions/index', layout: :'layouts/application'
  end

  get '/questions/new' do
    @question = Question.new
    haml :'questions/new', layout: :'layouts/application'
  end

  post '/questions' do
    @question = Question.new(params[:question])
    @question.raise_on_save_failure = false
    if @question.save
      @questions = Question.all
      haml :'questions/index', layout: :'layouts/application'
    else
      haml :'questions/new', layout: :'layouts/application'
    end
  end
end