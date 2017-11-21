class WelcomesController < ApplicationController
     layout "welcome"
    def index
        @intros = Intro.published
    end
end
