local component     = require("component")
local bit32         = require("bit32")
local internet      = component.getPrimary("internet")
local term          = require("term")
local gpu           = term.gpu()
local event         = require("event")
local filesystem    = require("filesystem")
local width, height = gpu.getResolution()


