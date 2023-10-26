FactoryBot.define do
  factory :execution do
    user

    task

    # after(:create) do |execution|
    #   execution.user.update!(roles: Role.find_by(id: execution.task.role_id))
    # end

    before(:create) do |execution|
      execution.user.roles << execution.task.role
    end
  end

end
