FactoryBot.define do
  factory :answer do
    answer_text "Esta es la respuesta a una pregunta, deberia ser lo suficientemente larga para poder abarcar un gran espacio"
    user_id 1
    question_id 2
  end
end