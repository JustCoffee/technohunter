class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
        can :manage, :all
    else
        if user.role? 1
            #Здесь то, что может делать предоставитель услуг
            can :create, :all
            can :view_profile
#            can :update, Offer do |offer| # В таком случае update будет работать только для того пользователя
#                offer.user == user 
#            end
                                       # Кто создал это предложение. Информация в БД user_id.
            can :update_car, Car do |car|
                car.user == user
            end

            can :update_truck, Truck do |truck|
                truck.user == user
            end

            can :update_equip, Equip do |equip|
                equip.user == user
            end
            
            can :destroy_equip, Equip do |equip|
                equip.user == user
            end
            can :destroy_truck, Truck do |truck|
                truck.user == user
            end            
            can :destroy_car, Car do |car|
                car.user == user
            end
            can :bid, :all
        else
            if user.role? 2
                #Здесь то, что может делать заказчик
                can :show, :all
                can :bid, :all
            else
                if user.role? 3
                    #Права модератора
                    can :show_moder_panel, :all
                    can :send_offer, :all
                    can :bid, :all
                    can :update_truck, :all
                    can :update_car, :all
                    can :update_equip, :all
                    can :destroy_equip, :all
                    can :destroy_car, :all
                    can :destroy_truck, :all
                    can :create, :all
                    can :view_profile
                else
                    #Права случайного посетителя
                    can :show, :all
                    can :bid, :all
                end
            end
        end
    end

    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
