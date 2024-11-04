local http = require("socket.http")
local ltn12 = require("ltn12")

local function download_file(url, destination)
    local response_body = {}
    local result, response_code = http.request{
        url = url,
        sink = ltn12.sink.table(response_body)
    }

    if response_code == 200 then
        local file = io.open(destination, "wb")
        file:write(table.concat(response_body))
        file:close()
        print("File downloaded successfully to " .. destination)
    else
        print("Failed to download file. HTTP response code: " .. response_code)
    end
end

local url = "http://example.com/file.txt" -- Replace with your file URL
local destination = "downloaded_file.txt" -- Replace with your desired file name
download_file(url, destination)
