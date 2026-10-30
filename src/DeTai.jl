module DeTai

export kiem_tra_dau_vao, tim_bien_dau, dem_so_nho_hon_x, giai_bai

function kiem_tra_dau_vao(du_lieu)
    if !(du_lieu isa Tuple) || length(du_lieu) != 2
        throw(ArgumentError("Du lieu dau vao phai la Tuple dang (a, x) voi a la mang va x la gia tri ngung."))
    end

    a, x = du_lieu

    if !(a isa Vector{Int})
        throw(ArgumentError("Mang 'a' phai la kieu Vector{Int}."))
    end

    if !(x isa Int)
        throw(ArgumentError("Gia tri 'x' phai la kieu Int."))
    end

    n = length(a)
    for i in 1:(n - 1)
        if a[i] > a[i + 1]
            throw(ArgumentError("Mang 'a' chua duoc sap xep theo thu tu khong giam (vi pham tai vi tri i: (a[i]) > (a[i+1]))."))
        end
    end

    return true
end

function tim_bien_dau(a::Vector{Int}, x::Int)::Int
    n = length(a)
    l = 1
    r = n
    pos = n + 1

    while l <= r
        giua = (l + r) ÷ 2
        if a[giua] >= x
            pos = giua
            r = giua - 1
        else
            l = giua + 1
        end
    end

    return pos
end

function dem_so_nho_hon_x(a::Vector{Int}, x::Int)::Int
    kiem_tra_dau_vao((a, x))
    pos = tim_bien_dau(a, x)
    return pos - 1
end

function giai_bai(du_lieu)
    a, x = du_lieu
    return dem_so_nho_hon_x(a, x)
end

end