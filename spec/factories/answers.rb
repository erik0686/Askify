FactoryBot.define do
  factory :answer do
    answer_text "Esta es la respuesta a una pregunta hecha por mi, deberia ser lo suficientemente larga para poder abarcar un gran espacio"
    user_id 5
    question_id 19
  end
end