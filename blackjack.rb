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

def say_total(player, total)
  puts "#{player} total is #{total}"
end

#method to read out hand
def read_hand(player, hand)
  read_hand = "#{player} hand is "
  hand.each do |x|
    read_hand += x[0].to_s
    read_hand += " of "
    read_hand += x[1].to_s
    read_hand += " | "
  end
  return read_hand
end

#method to put read head to screen
def say_hand(read_hand)
  puts read_hand
end  


deck = values.product(suits)
deck.shuffle!


#Deal to player
player_hand = deck.pop(2)

player_read_hand = read_hand("player", player_hand)

say_hand(player_read_hand)

player_total = total(player_hand)

say_total("player", player_total)

puts "--------------------------------------------------------"

#Deal to computer

computer_hand = deck.pop(2)


computer_read_hand = read_hand("computer", computer_hand)

say_hand(computer_read_hand)

computer_total = total(computer_hand)

say_total("Computer", computer_total)


# If dealer is below 17, hit dealer
if computer_total < 17
  begin
  hit = deck.pop
  computer_hand = computer_hand.push(hit)

  # print computer hand to screen
  computer_read_hand = read_hand("computer", computer_hand)
  say_hand(computer_read_hand)
  computer_total = total(computer_hand)
  say_total("Computer", computer_total)
  end until computer_total >= 17 
end

# Ask player if they would like to be hit.
hit_answer = gets.chomp.downcase
if hit_answer == "y"
  player_hand = player_hand.push (deck.pop)
end 



player_read_hand = read_hand("player", player_hand)

say_hand(player_read_hand)

player_total = total(player_hand)

say_total("player", player_total)

if player_total > 21
  puts "Bust, you went over 21.. Computer wins"
elsif computer_total > 21
  puts "Bust, computer went over 21.. player wins"
elsif player_total < computer_total
  puts "Computer wins"
else  
  puts "You win"
end      
      