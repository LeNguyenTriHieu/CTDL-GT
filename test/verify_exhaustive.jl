# Oracle độc lập: Quét tuyến tính count(y -> y < x, a), không gọi thuật toán chính để tạo expected[cite: 69].
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

function verify_all()
    total_tests = 0
    val_pool = [-5, -2, 0, 1, 2, 2, 4, 5, 9]

    # Hàm sinh tất cả các mảng số nguyên đã sắp xếp chiều dài len từ val_pool
    function gen_sorted_arrays(len, start_idx)
        if len == 0
            return [Int[]]
        end
        res = Vector{Vector{Int}}()
        for i in start_idx:length(val_pool)
            sub_arrs = gen_sorted_arrays(len - 1, i)
            for sub in sub_arrs
                push!(res, vcat(val_pool[i], sub))
            end
        end
        return res
    end

    for n in 0:6
        test_arrays = n == 0 ? [Int[]] : gen_sorted_arrays(n, 1)

        for a in test_arrays
            x_targets = unique(vcat([-10, -6, 0, 10], a, a .- 1, a .+ 1))

            for x in x_targets
                # Oracle độc lập: Quét tuyến tính O(N) tạo expected[cite: 69]
                expected = count(y -> y < x, a)

                # Thuật toán chính: Tìm kiếm nhị phân O(log N)
                actual = dem_so_nho_hon_x(a, x)
                @assert actual == expected "LOI KHI VERIFY: a = $a, x = $x | Expected: $expected, Got: $actual"[cite: 69]

                total_tests += 1
            end
        end
    end

    # Kiểm thử vét cạn các ca dữ liệu vi phạm tiền điều kiện (Validator)
    invalid_arrays = [
        [4, 1, 2, 2],
        [3, 2, 1],
        [1, 5, 3, 7]
    ]
    for a in invalid_arrays
        try
            dem_so_nho_hon_x(a, 2)
            @assert false "Chua bat loi voi mang chua sap xep"
        catch err
            @assert err isa ArgumentError || err isa MethodError
        end
        total_tests += 1
    end

    println("EXHAUSTIVE_OK total_tests=$total_tests n=0..6")[cite: 69]
    println("ORACLE=Linear Scan; count(y -> y < x, a) checked")[cite: 69]
    println("This checks sorted arrays up to n=6; mathematical proof covers all valid n.")[cite: 69]
end

verify_all()