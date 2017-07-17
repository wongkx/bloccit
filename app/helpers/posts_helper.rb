module PostsHelper
    def user_is_authorized_for_posts?(post)
        current_user && (current_user == post.user || current_user.admin?)
    end
    
    def user_is_moderator?
        current_user && current_user.moderator?
    end
end
