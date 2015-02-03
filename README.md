# boris_bikes

[![Test Coverage](https://codeclimate.com/github/chandley/boris_bikes/badges/coverage.svg)](https://codeclimate.com/github/chandley/boris_bikes)
[![Code Climate](https://codeclimate.com/github/chandley/boris_bikes/badges/gpa.svg)](https://codeclimate.com/github/chandley/boris_bikes)

## Summary

Model a bike hire system - week 1 exercise

### Problem

We are creating a simple system for managing Boris Bikes in London. Our system will keep track of a number of docking stations and the bikes. It will allow you to rent the bikes and return them. Occasionally the bikes will break and then they will be unavailable for rental. There will also be a garage to fix the bikes and a van to move the bikes between the stations and the garage.

### Languages/Platforms/Tools

| Languages | Technologies  | Testing Frameworks| Misc
| :-------------------------------------------- |:--------------|:-----------|:----|
| Ruby      |               | Rspec             |               |
|           |               |                   |               |
|           |               |                   |  
|           |               |

### Solution

THere is a module BikeContainer for the functionality in common to anything which holds/gives/recieves a bike.

### Setup

* this exercise lacks a user interface
* run from irb
```
$ irb
2.0.0-p594 :003 > require './lib/bike.rb'
 => true
2.0.0-p594 :004 > bike = Bike.new
 => #<Bike:0x007ffadd1c7e80 @broken=false>
2.0.0-p594 :005 > require './lib/docking_station.rb'
 => true
2.0.0-p594 :006 > old_street = DockingStation.new
 => #<DockingStation:0x007ffadd16e6f0 @capacity=20>
2.0.0-p594 :007 > old_street.dock(bike)
 => [#<Bike:0x007ffadd1c7e80 @broken=false>]
2.0.0-p594 :008 > old_street
 => #<DockingStation:0x007ffadd16e6f0 @capacity=20, @bikes=[#<Bike:0x007ffadd1c7e80 @broken=false>]>
 ```

### Tests
100% test coverage
```
rspec
```

### Images

### To do



### Learning points

* Modules
* Class structure
* Single responsibility and other SOLID principles

