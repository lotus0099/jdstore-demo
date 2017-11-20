class WelcomesController < ApplicationController
     
    def index
        @intros = Intro.published
    end
end
