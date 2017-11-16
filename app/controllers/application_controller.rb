class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_cart
    def current_cart
        @current_cart ||= find_cart
    end

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])

        cart = Cart.create if cart.blank?
        session[:cart_id] = cart.id
        cart
    end
end
