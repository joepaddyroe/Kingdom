require 'Rules.rb'

class Kingdom
  
  $rules = Rules.new

  def initialize(gold,lumber,food,manpower,land,population,goldMarketValue,lumberMarketValue,foodMarketValue)
    @gold = gold
    @lumber = lumber
    @food = food
    @manpower = manpower
    @land = land
    @population = population
    @goldMarketValue = goldMarketValue
    @lumberMarketValue = lumberMarketValue
    @foodMarketValue = foodMarketValue
    

  end
  
  def set_message( message )
    @message = message
  end
  def get_message()
    return @message
  end
  
  def set_input( inputAmount )
    @input = inputAmount
  end
  def get_input
    return @input
  end
  
  def set_gold( goldAmount )
  		@gold = goldAmount
  end
  def get_gold
  		return @gold
  end
  
  
  def set_lumber( lumberAmount )
  		@lumber = lumberAmount
  end
  def get_lumber
  		return @lumber
  end
  
  
  def set_food( foodAmount )
  		@food = foodAmount
  end
  def get_food
  		return @food
  end
  
  
  def set_manpower( manpowerAmount )
  		@manpower = manpowerAmount
  end
  def get_manpower
  		return @manpower
  end
  
  
  def set_land( landAmount )
  		@land = landAmount
  end
  def get_land
  		return @land
  end
 
  def set_population( populationAmount )
      @population = populationAmount
  end
  def get_population
      return @population
  end
  
  def mineGold
    if @lumber > 0 and @manpower > 0
      set_gold(get_gold + $rules.get_goldMineReturnAmount() * @goldMarketValue.round(2))
      set_lumber(get_lumber - 1)    
      set_manpower(get_manpower - 1)
      set_message('Gold Mined!')
    else
      if @lumber < 1 and @manpower < 1
        set_message('Not enough Lumber or Manpower')
      elsif @manpower < 1
        set_message('Not enough Manpower') 
      elsif @lumber < 1
        set_message('Not enough Lumber')        
      end
    end
  end
  
  def cutLumber
    if @manpower > 0 and @food > 0
      set_lumber(get_lumber + $rules.get_lumberCuttingReturnAmount())
      set_manpower(get_manpower - 1)
      set_food(get_food - 1)
      set_message('Lumber Cut!')
    else
      if @food < 1 and @manpower < 1
        set_message('Not enough Food or Manpower')
      elsif @manpower < 1
        set_message('Not enough Manpower') 
      elsif @food < 1
        set_message('Not enough Food')        
      end
    end  
  end
  
  def farmFood
    if @manpower > 0
      set_food(get_food + $rules.get_foodFarmingReturnAmount())
      set_manpower(get_manpower - 1)
      set_message('Food Farmed!')
    else
      if @manpower < 1
        set_message('Not enough Manpower')
      end
    end
  end
  
  def hireMen
    if @gold > 0 and @food > 0 and @population > 10
      set_manpower(get_manpower + $rules.get_manHiringReturnAmount())
      set_gold(get_gold - 1)
      set_food(get_food - 1)
      set_population(get_population - 10)
      set_message('Men Hired!')
    else
      if @gold < 1 and @food < 1 and @population < 2
        set_message('Not enough Gold, Food or Population')
      elsif @gold < 1
        set_message('Not enough Gold')
      elsif @food < 1
        set_message('Not enough Food')
      elsif @population < 11
        set_message('Not enough Population')
      end
    end
  end
  
  def conquerLand
    if @manpower > 21 and @gold > 21 and @food > 21 and @population > 51   
      set_land(get_land + $rules.get_landConqueringReturnAmount())
      set_manpower(get_manpower - 20)
      set_gold(get_gold - 20)
      set_food(get_food - 20)
      set_population(get_population - 50)
    else
      if @manpower < 21 and @gold < 21 and @food < 21 and @population < 51
        set_message('Not enough Manpower, Gold, Food or Population')
      elsif @manpower < 21
        set_message('Not enough Manpower')
      elsif @gold < 21
        set_message('Not enough Gold')
      elsif @food < 21 
        set_message('Not enough Food')
      elsif @population < 51   
        set_message('Not enough Population')
      end
    end
  end
  
  def sellLumber()
    if @lumber > 0
    set_gold(get_gold + @lumberMarketValue.round(2))   
    set_lumber(get_lumber - 1)
    else
      set_message('Not enough Lumber') 
    end 
  end
  
  def sellFood()
    if @food > 0
      set_gold(get_gold() + @foodMarketValue.round(2))
      set_food(get_food - 1)
    else
      set_message('Not enough Food')
    end
  end
  
  def randomMarket()
    @goldMarketValue = 1 + rand($rules.get_maxGoldMarketValue) 
    @goldMarketValue.round(1)
    @lumberMarketValue = 1 + rand($rules.get_maxLumberMarketValue)
    @foodMarketValue = 1 + rand($rules.get_maxFoodMarketValue)
  end
  
  
  def tick()
    render()
    inputChecker()
    resourceManagement()
    randomMarket()
  end
    
  def render()
    system("cls")
    puts '**********************************************************************'
    puts '******************************-KINGDOM-*******************************'
    puts '**********************************************************************'
    puts "       GOLD: #{get_gold} ** LUMBER: #{get_lumber} ** FOOD: #{get_food} ** MANPOWER: #{get_manpower} ** LAND: #{get_land}       "
    puts '**********************************************************************'
    puts '**********************************************************************'
    puts "                           POPULATION: #{get_population}                                 "
    puts '**********************************************************************'
    puts '**********************************************************************'
    puts "  Market Values: GOLD: #{@goldMarketValue.round(2)} **  Lumber: #{@lumberMarketValue.round(2)} **  Food: #{@foodMarketValue.round(2)} "
    #puts "  Market Values: GOLD: " 
    #printf('%.2f', @goldMarketValue)
    puts '**********************************************************************'
    puts ''
    puts 'Enter,'
    puts '1 to Mine Gold:Costs 1 Lumber,1 Manpower / Returns 1 Gold'
    puts '2 to Cut Lumber:Costs 1 Manpower,1 Food / Returns 1 Lumber'
    puts '3 to Farm Food:Costs 1 Manpower / Returns 5 Food'
    puts '4 to Hire Men:Costs 1 Gold,1 Food,10 Population / Returns 1 Manpower'
    puts '5 to Conquer Land:Costs 1 Manpower,1 Gold,1 Food,50 Population / Returns 1 Land'
    puts '6 to sell Lumber'
    puts '7 to sell Food'
    puts 'Enter 0 to EXIT GAME'
    puts "Last event: #{get_message}" 
  end

  def inputChecker()
    #set_input( gets )  
    inputFinal = gets.to_i
    
    if inputFinal == 0  
      exit()
    elsif inputFinal == 1
      mineGold()
    elsif inputFinal == 2
      cutLumber()
    elsif inputFinal == 3
      farmFood()
    elsif inputFinal == 4
      hireMen()
    elsif inputFinal == 5
      conquerLand()
    elsif inputFinal == 6
      sellLumber()
    elsif inputFinal == 7
      sellFood()      
    else
      set_message('Sorry, that was an invalid selection!')
    end        
  end
  
  def resourceManagement()

    if @food > 0 
      @population = @population + @land * $rules.get_populationIncreaseFactor()
      @food = @food - @population/10
    end
    if @food < 1
      @population = @population - 1
    end
    if @gold < 1
      @manpower = @manpower - 1
    end
    if @population < 1
      puts "You are the king of no one! Try again"
      exit()
    end
    if @land > 9
      puts'CONGRATULATIONS!!! YOU HAVE CONQUERED THE KNOWN WORLD!!!!'
      exit()
    end
  end
    
end

class Main
  kingdom = Kingdom.new(10,10,10,10,1,20,1,1,1)
  exitswitch = 0
  while exitswitch != 1  
    kingdom.tick()
  end
end
