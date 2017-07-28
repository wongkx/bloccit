module FavoritesHelper
    def has_favorites?
        current_user && current_user.favorites.count > 0
    end
end
