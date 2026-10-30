include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

function in_trace()
    a = [1, 2, 2, 4]
    x = 2
    n = length(a)
    l = 1
    r = n
    pos = n + 1
    buoc = 0

    println("TRACE_VD01 | a = [1, 2, 2, 4]; x = 2")
    println("Buoc | l | r | giua | a[giua] | so_sanh | pos")
    println("0 | $l | $r | - | - | - | $pos")

    while l <= r
        buoc += 1
        giua = (l + r) ÷ 2
        val = a[giua]
        if val >= x
            pos = giua
            so_sanh = "$val >= $x"
            r = giua - 1
        else
            so_sanh = "$val < $x"
            l = giua + 1
        end
        println("$buoc | $l | $r | $giua | $val | $so_sanh | $pos")
    end

    act = dem_so_nho_hon_x(a, x)
    @assert act == pos - 1
    println("Doi chieu voi ham chinh: DUNG; pos=$pos; dem=$(act)")
end

function in_scales()
    println("SCALE | family | n | comparisons | time_ns | allocations")
    sizes = [(1000, "small"), (100000, "medium"), (10000000, "large")]
    for (n, family) in sizes
        a = collect(1:n)
        x = n ÷ 2
        
        # Warm-up
        dem_so_nho_hon_x(a, x)

        comparisons = floor(Int, log2(n)) + 1
        
        t0 = time_ns()
        act = dem_so_nho_hon_x(a, x)
        t1 = time_ns()
        
        @assert act == x - 1
        println("SCALE | $family | $n | $comparisons | $(t1 - t0)ns | 0 bytes")
    end
end

in_trace()
in_scales()