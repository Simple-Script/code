math.randomseed(os.time())
local target = math.random(0, 20)
local guess = nil

print("Welcome to the Higher or Lower Game!")
print("Guess a number between 0 and 20.")

while guess ~= target do
    io.write("Enter your guess: ")
    guess = tonumber(io.read())

    if guess < 0 or guess > 20 then
        print("Please guess a number between 0 and 20.")
    elseif guess < target then
        print("Higher!")
    elseif guess > target then
        print("Lower!")
    else
        print("Congratulations! You've guessed the number " .. target .. "!")
    end
end
