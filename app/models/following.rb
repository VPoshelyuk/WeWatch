class Following < ApplicationRecord

    belongs_to :user, touch: true, counter_cache: true
    belongs_to :followed_user, counter_cache: :followers_count, class_name: 'User'

    validate :cant_self_follow



    private

    def cant_self_follow

        return unless user_id == followed_user_id
        errors.add :user, "Can't Follow Yourself"
    end




end