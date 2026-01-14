def stock_picker(prices)
  buy_day = 0
  sell_day = 0
  max_profit = 0

  for i in 0...prices.length
    for j in i+1...prices.length
      profit = prices[j] - prices[i]

      if profit > max_profit
        max_profit = profit
        buy_day = i
        sell_day = j
      end
    end
  end

  [buy_day, sell_day]
end

puts stock_picker([17,7,6,9,15,8,6,1,10]).inspect
