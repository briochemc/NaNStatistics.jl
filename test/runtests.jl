using NaNStatistics
using Test, Statistics

@testset "ArrayStats" begin include("testArrayStats.jl") end
@testset "Histograms" begin include("testHistograms.jl") end
