include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai
using Test

@testset "Kiem thu de tai ca nhan DT022 - Le Nguyen Tri Hieu" begin
    # Ca VD01, VD02
    @test dem_so_nho_hon_x([1, 2, 2, 4], 2) == 1
    @test dem_so_nho_hon_x([1, 2, 2, 4], 5) == 4

    # Ca TK01, TK02
    @test dem_so_nho_hon_x([1, 3, 3, 3, 5, 7, 9], 3) == 1
    @test dem_so_nho_hon_x([-10, -5, -2, 0, 3, 8], -2) == 2

    # Ca BIEN01, BIEN02, BIEN03
    @test dem_so_nho_hon_x([1, 2, 2, 4], 0) == 0
    @test dem_so_nho_hon_x(Int[], 2) == 0
    @test dem_so_nho_hon_x([5], 5) == 0

    # Ca LOI01 (Validator)
    @test_throws ArgumentError dem_so_nho_hon_x([4, 1, 2, 2], 2)

    # Ca KT09 - KT12 (Kiem tra kieu va helper)
    @test_throws MethodError dem_so_nho_hon_x([1, 2, 3], 2.5)
    @test giai_bai(([1, 2, 2, 4], 0)) == 0
    @test giai_bai(([1, 2, 2, 4], 5)) == 4
end