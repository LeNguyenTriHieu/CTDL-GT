# ==============================================================================
# BỘ KIỂM THỬ TỰ ĐỘNG DỰ ÁN DT022
# Đề tài: Đếm số phần tử nhỏ hơn x bằng Tìm kiếm nhị phân
# Sinh viên: Lê Nguyễn Trí Hiểu | MSSV: N24DCDT025 | Lớp: D24CQDT01-N
# ==============================================================================

using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

@testset "DT022 - 12 ca chuc nang" begin
    # T01: Ca VD01 tren phieu de; vi tri bien pos=2; ket qua dem=1.
    @test tim_bien_dau([1, 2, 2, 4], 2) == 2
    @test dem_so_nho_hon_x([1, 2, 2, 4], 2) == 1

    # T02: Ca VD02 tren phieu de; x lon hon moi phan tu; pos=5; ket qua dem=4.
    @test tim_bien_dau([1, 2, 2, 4], 5) == 5
    @test dem_so_nho_hon_x([1, 2, 2, 4], 5) == 4

    # T03: TK01 trung khoa; tim vi tri dau tien a[i] >= x; pos=2; ket qua dem=1.
    @test tim_bien_dau([1, 3, 3, 3, 5, 7, 9], 3) == 2
    @test dem_so_nho_hon_x([1, 3, 3, 3, 5, 7, 9], 3) == 1

    # T04: TK02 so nguyen am; chuyen bien tim kiem nhi phan tren mang am.
    @test tim_bien_dau([-10, -5, -2, 0, 3, 8], -2) == 3
    @test dem_so_nho_hon_x([-10, -5, -2, 0, 3, 8], -2) == 2

    # T05: BIEN01 x nho hon tat ca phan tu; pos=1; ket qua dem=0.
    @test tim_bien_dau([1, 2, 2, 4], 0) == 1
    @test dem_so_nho_hon_x([1, 2, 2, 4], 0) == 0

    # T06: BIEN02 mang rong Int[]; pos=1; ket qua dem=0.
    @test tim_bien_dau(Int[], 2) == 1
    @test dem_so_nho_hon_x(Int[], 2) == 0

    # T07: BIEN03 mang 1 phan tu [5], x=5; pos=1; ket qua dem=0.
    @test tim_bien_dau([5], 5) == 1
    @test dem_so_nho_hon_x([5], 5) == 0

    # T08: mang tang dan don dieu, x lon hon phan tu cuoi; pos=6; ket qua dem=5.
    @test tim_bien_dau([1, 2, 3, 4, 5], 6) == 6
    @test dem_so_nho_hon_x([1, 2, 3, 4, 5], 6) == 5

    # T09: mang cac phan tu bang nhau [2, 2, 2, 2, 2], x=2; pos=1; ket qua dem=0.
    @test tim_bien_dau([2, 2, 2, 2, 2], 2) == 1
    @test dem_so_nho_hon_x([2, 2, 2, 2, 2], 2) == 0

    # T10: mang cac phan tu bang nhau [2, 2, 2, 2, 2], x=3; pos=6; ket qua dem=5.
    @test tim_bien_dau([2, 2, 2, 2, 2], 3) == 6
    @test dem_so_nho_hon_x([2, 2, 2, 2, 2], 3) == 5

    # T11: quy mo lon n=100; kiem tra tinh chinh xac cua phep tim kiem nhi phan.
    a100 = collect(1:100)
    @test tim_bien_dau(a100, 50) == 50
    @test dem_so_nho_hon_x(a100, 50) == 49

    # T12: mang toan so nguyen am, x=0; pos=6; ket qua dem=5.
    @test tim_bien_dau([-5, -4, -3, -2, -1], 0) == 6
    @test dem_so_nho_hon_x([-5, -4, -3, -2, -1], 0) == 5
end

@testset "Du lieu vao va ham kiem tra" begin
    @test_throws ArgumentError dem_so_nho_hon_x([4, 1, 2, 2], 2)   # V01: mang chua sap xep
    @test_throws ArgumentError dem_so_nho_hon_x([3, 2, 1], 2)      # V02: mang giam dan
    @test_throws ArgumentError dem_so_nho_hon_x([1, 2, 5, 3, 7], 2) # V03: mang vi pham thu tu o giua
    @test_throws ArgumentError kiem_tra_dau_vao([1, 2, 2, 4])       # V04: truyen mang thay vi Tuple
    @test_throws ArgumentError kiem_tra_dau_vao(([1, 2], 2, 3))     # V05: Tuple sai so luong phan tu
    @test_throws ArgumentError kiem_tra_dau_vao(("1, 2, 3", 2))     # V06/KT10: truyen String thay vi Vector
    @test_throws ArgumentError kiem_tra_dau_vao(([1, 2, 3], 2.5))   # V07/KT09: x khong phai so nguyen
    @test_throws ArgumentError kiem_tra_dau_vao(([1.0, 2.0], 2))   # V08: mang phan tu Float
    @test kiem_tra_dau_vao(([1, 2, 4], 2))                           # V09: dau vao hop le
    @test_throws ArgumentError kiem_tra_dau_vao(([4, 1, 2], 2))    # V10: validator bat mang khong sap xep
    @test giai_bai(([1, 2, 2, 4], 2)) == 1                            # V11/KT11: ham giao tiep giai_bai VD01
    @test giai_bai(([1, 2, 2, 4], 5)) == 4                            # V12/KT12: ham giao tiep giai_bai VD02
    @test tim_bien_dau([1, 2, 2, 4], 2) == 2                        # V13: tim_bien_dau VD01
    @test tim_bien_dau([1, 2, 2, 4], 5) == 5                        # V14: tim_bien_dau VD02
    @test tim_bien_dau([1, 2, 2, 4], 0) == 1                        # V15: tim_bien_dau BIEN01
    @test tim_bien_dau(Int[], 2) == 1                               # V16: tim_bien_dau mang rong
end

println("DA QUA 12 CA CHUC NANG VA CAC KIEM TRA DU LIEU VAO.")