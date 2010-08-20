class Rules
  
  def initialize()
    #These are he return amount for each resource in the game, per tick
    @goldMineReturnAmount = 1
    @foodFarmingReturnAmount = 5
    @lumberCuttingReturnAmount = 5
    @manHiringReturnAmount = 10
    @landConqueringReturnAmount = 1
    
    #These are the maximum random ranges returned fro the resource market values per tick
    @maxGoldMarketVaue = 5
    @maxLumberMarketVaue = 3
    @maxFoodMarketVaue = 2
    
    #These are various game factors such as win conditions and population increase factors
    @gameWinLandAmount = 10
    @populationIncreaseFactor = 2  
  
  end

  #These are the getter functions for the class, they return all o the values above to the game

  def get_goldMineReturnAmount()
    return @goldMineReturnAmount.to_i
  end
  def get_foodFarmingReturnAmount()
    return @foodFarmingReturnAmount.to_i
  end
  def get_lumberCuttingReturnAmount() 
    return @lumberCuttingReturnAmount.to_i
  end
  def get_manHiringReturnAmount()
    return @manHiringReturnAmount.to_i
  end
  def get_landConqueringReturnAmount()
    return @landConqueringReturnAmount.to_i
  end
  def get_maxGoldMarketValue()
    return @maxGoldMarketValue.to_i
  end
  def get_maxLumberMarketValue()
    return @maxLumberMarketValue.to_i
  end
  def get_maxFoodMarketValue()
    return @maxoodMarketValue.to_i
  end
  def get_gameWinLandAmount()
    return @gameWinLandAmount.to_i
  end
  def get_populationIncreaseFactor()
    return @populationIncreaseFactor.to_i
  end
end


