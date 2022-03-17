def stock_picker(stock_prices)
    profit = Hash.new{}
    max_sale = 0
    buy_sell = [0, 0]

    # calculates price differences between current and future days
    stock_prices.each_with_index do |price, day|
        price_diff = stock_prices[day..-1].map{|sale| sale-price}
        profit[day] = get_max_sale(price_diff)
    end

    profit.each do |day, best_sale|
        if best_sale[1] > max_sale
            max_sale = best_sale[1]
            buy_sell = [day, day+best_sale[0]]
        end
    end

    return buy_sell
end


def get_max_sale(array_sales)
    # returns the best day to sell and the profits
    array_sales.each_with_index do |price, index|
        if price == array_sales.max
            return [index, array_sales.max]
        end
    end # day of max sale and price
end

p stock_picker([17,3,6,9,15,8,6,1,10])

