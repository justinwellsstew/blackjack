#Blackjack

suits = ["clubs", "diamonds", "hearts", "spades"]
values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "King", "Queen", "Ace"]

def total(hand)
  total = 0
  hand.each do |x|
    if x[0] == "Ace"
      total += 11
    elsif x[0] =="Jack" || x[0] == "Queen" or x[0] == "King"
      total += 10
    else 
      total += x[0]  
    end
  end
  return total
end 

def say_total(total)
  puts "your total is #{total}" 
end  


deck = values.product(suits)

hand = deck.sample(2)

puts "You have a #{hand[0][0]} of #{hand[0][1]} and a #{hand[1][0]} of #{hand[1][1]} "

#calculate card totals
total = total(hand)

say_total(total)

  


