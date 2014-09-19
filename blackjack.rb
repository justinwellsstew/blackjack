#Blackjack

suits = ["clubs", "diamonds", "hearts", "spades"]
values = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "King", "Queen", "Ace"]


#Method to determine values for each card
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

#method to read out hand
def read_hand(player, hand)
  read_hand = "#{player} hand is "
  hand.each do |x|
    read_hand += x[0].to_s
    read_hand += " of "
    read_hand += x[1].to_s
    read_hand += " and "
  end
  return read_hand 
end 

#method to put read head to screen
def say_hand(read_hand)
  puts read_hand
end   


deck = values.product(suits)


#Deal to player
player_hand = deck.sample(2)

player_read_hand = read_hand("player", player_hand)

say_hand(player_read_hand)

player_total = total(player_hand)

say_total(player_total)


puts "--------------------------------------------------------"

#Deal to computer

computer_hand = deck.sample(2)

computer_read_hand = read_hand("computer", computer_hand)

say_hand(computer_read_hand)

computer_total = total(computer_hand)

say_total(computer_total)



puts "Would you like to be hit, put y for YES and n for NO"
hit_answer = gets.chomp.downcase
if hit_answer == "y"
  player_hand = player_hand.push (deck.sample)
end

player_read_hand = read_hand("player", player_hand)

say_hand(player_read_hand)

player_total = total(player_hand)

say_total(player_total)


  


