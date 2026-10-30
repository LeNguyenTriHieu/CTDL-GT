include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

cases = [
    ("T01", [1, 2, 2, 4], 2, 1),
    ("T02", [1, 2, 2, 4], 5, 4),
    ("T03", [1, 3, 3, 3, 5, 7, 9], 3, 1),
    ("T04", [-10, -5, -2, 0, 3, 8], -2, 2),
    ("T05", [1, 2, 2, 4], 0, 0),
    ("T06", Int[], 2, 0),
    ("T07", [5], 5, 0),
    ("T08", [1, 2, 3, 4, 5], 6, 5),
    ("T09", [2, 2, 2, 2, 2], 2, 0),
    ("T10", [2, 2, 2, 2, 2], 3, 5),
    ("T11", collect(1:100), 50, 49),
    ("T12", [-5, -4, -3, -2, -1], 0, 5)
]

println("CATALOG | id | input | expected | actual | result")
for (id, a, x, exp) in cases
    act = dem_so_nho_hon_x(a, x)
    ok = (act == exp)
    @assert ok id
    short_input = length(a) > 10 ? "n=$(length(a));a=1..100;x=$x" : "a=$a;x=$x"
    expected = "expected=$exp"
    actual = "actual=$act"
    println("CATALOG | $id | $short_input | $expected | $actual | PASS")
end

function throws_argument(f)
    try
        f(); return false
    catch err
        return err isa ArgumentError || err isa MethodError
    end
end

validators = [
    ("V01", "a=[4,1,2,2];x=2", "ArgumentError", () -> throws_argument(() -> dem_so_nho_hon_x([4, 1, 2, 2], 2))),
    ("V02", "a=[3,2,1];x=2", "ArgumentError", () -> throws_argument(() -> dem_so_nho_hon_x([3, 2, 1], 2))),
    ("V03", "a=[1,2,5,3,7];x=2", "ArgumentError", () -> throws_argument(() -> dem_so_nho_hon_x([1, 2, 5, 3, 7], 2))),
    ("V04", "du_lieu=[1,2,2,4]", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao([1, 2, 2, 4]))),
    ("V05", "du_lieu=([1,2],2,3)", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao(([1, 2], 2, 3)))),
    ("V06/KT10", "a=String;x=2", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao(("1,2,3", 2)))),
    ("V07/KT09", "a=[1,2,3];x=2.5", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao(([1, 2, 3], 2.5)))),
    ("V08", "a=Float;x=2", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao(([1.0, 2.0], 2)))),
    ("V09", "a=[1,2,4];x=2", "true", () -> kiem_tra_dau_vao(([1, 2, 4], 2))),
    ("V10", "a=[4,1,2];x=2", "ArgumentError", () -> throws_argument(() -> kiem_tra_dau_vao(([4, 1, 2], 2)))),
    ("V11/KT11", "giai_bai(([1,2,2,4],2))", "1", () -> giai_bai(([1, 2, 2, 4], 2)) == 1),
    ("V12/KT12", "giai_bai(([1,2,2,4],5))", "4", () -> giai_bai(([1, 2, 2, 4], 5)) == 4),
    ("V13", "a=[1,2,2,4];x=2", "2", () -> tim_bien_dau([1, 2, 2, 4], 2) == 2),
    ("V14", "a=[1,2,2,4];x=5", "5", () -> tim_bien_dau([1, 2, 2, 4], 5) == 5),
    ("V15", "a=[1,2,2,4];x=0", "1", () -> tim_bien_dau([1, 2, 2, 4], 0) == 1),
    ("V16", "a=Int[];x=2", "1", () -> tim_bien_dau(Int[], 2) == 1)
]

for (id, input, expected, check) in validators
    @assert check() id
    println("CATALOG | $id | $input | $expected | $expected | PASS")
end

println("CATALOG_OK functional_cases=$(length(cases)) helper_validator_cases=$(length(validators)) total_cases=$(length(cases)+length(validators))")