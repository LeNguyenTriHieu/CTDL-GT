include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai
using Printf

function in_ket_qua(a::Vector{Int}, x::Int; ma_ca::String="", ten_ca::String="")
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    if !isempty(ma_ca)
        println("Ma ca: $ma_ca - $ten_ca")
    end
    println("Input: Mang a = $a; Gia tri x = $x")
    n = length(a)
    println("So phan tu (n): $n")
    println("Chi so i | Gia tri a[i] | So sanh voi x = $x")

    if isempty(a)
        println("       (Mang rong - Khong co phan tu)")
    else
        for i in 1:n
            cmp_str = a[i] >= x ? ">= " : "< "
            @printf("%8d | %12d | %d %s%d\n", i, a[i], a[i], cmp_str, x)
        end
    end

    pos = tim_bien_dau(a, x)
    actual = dem_so_nho_hon_x(a, x)
    expected = count(y -> y < x, a)

    println("Vi tri bien dau pos (a[pos] >= x): $pos")
    println("Ket qua thuc te (Actual)        : $actual")
    println("Ket qua ky vong (Expected)      : $expected")
    println("Kiem tra ket qua (Actual == Exp): ", actual == expected ? "PASSED (DUNG)" : "FAILED (SAI)")
    println("[EXIT CODE: 0]")
    return actual
end

function nhap_ban_phim()
    println("Nhap mang cac so nguyen da sap xep (cach nhau boi dau cach):")
    line_a = readline()
    a = isempty(strip(line_a)) ? Int[] : parse.(Int, split(line_a))

    println("Nhap gia tri ngung x can dem:")
    line_x = readline()
    x = parse(Int, strip(line_x))

    println("\n[Input Da Nhap]: a = $a | x = $x")
    in_ket_qua(a, x)
end

function minh_hoa_du_lieu_sai()
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: A08 - LOI01 - Ca input khong hop le")
    println("Input: Mang a = [4, 1, 2, 2]; Gia tri x = 2")
    println("Kiem tra Validator: Mang chua duoc sap xep theo thu tu khong giam")
    println("DA TU CHOI DU LIEU KHI KIEM TRA TIEN DIEU KIEN:")
    try
        dem_so_nho_hon_x([4, 1, 2, 2], 2)
    catch loi
        if loi isa ArgumentError || loi isa MethodError
            println("-> Catch Error: ", sprint(showerror, loi))
            println("Ket qua Validator: DUNG (Da bat loi dung nhu mong doi)")
            println("[EXIT CODE: 0]")
            return nothing
        end
        rethrow()
    end
    error("LOI: Chuong trinh da chap nhan mang chua sap xep")
end

function minh_hoa_kt09()
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: KT09 - Sai kieu gia tri x (x = 2.5)")
    println("Input: a = [1, 2, 3]; x = 2.5 (Kieu Float64)")
    try
        kiem_tra_dau_vao(([1, 2, 3], 2.5))
    catch loi
        if loi isa ArgumentError
            println("-> Catch Error: ", sprint(showerror, loi))
            println("Ket qua Validator: PASSED (Da tu choi gia tri x khong phai so nguyen)")
            println("[EXIT CODE: 0]")
            return nothing
        end
        rethrow()
    end
end

function minh_hoa_kt10()
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: KT10 - Sai kieu du lieu mang a (a = \"1, 2, 3\")")
    println("Input: du_lieu = (\"1, 2, 3\", 2)")
    try
        kiem_tra_dau_vao(("1, 2, 3", 2))
    catch loi
        if loi isa ArgumentError
            println("-> Catch Error: ", sprint(showerror, loi))
            println("Ket qua Validator: PASSED (Da tu choi cau truc dau vao khong hop le)")
            println("[EXIT CODE: 0]")
            return nothing
        end
        rethrow()
    end
end

function minh_hoa_kt11()
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: KT11 - Tich hop ham giao tiep giai_bai() cho VD01")
    println("Input: du_lieu = ([1, 2, 2, 4], 2)")
    kq = giai_bai(([1, 2, 2, 4], 2))
    println("Ket qua giai_bai(du_lieu): $kq")
    println("Kiem tra ket qua: ", kq == 1 ? "PASSED (DUNG)" : "FAILED (SAI)")
    println("[EXIT CODE: 0]")
end

function minh_hoa_kt12()
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: KT12 - Tich hop ham giao tiep giai_bai() cho VD02")
    println("Input: du_lieu = ([1, 2, 2, 4], 5)")
    kq = giai_bai(([1, 2, 2, 4], 5))
    println("Ket qua giai_bai(du_lieu): $kq")
    println("Kiem tra ket qua: ", kq == 4 ? "PASSED (DUNG)" : "FAILED (SAI)")
    println("[EXIT CODE: 0]")
end

if "--nhap" in ARGS
    nhap_ban_phim()
elseif any(startswith("--ca="), ARGS)
    ca = only(filter(startswith("--ca="), ARGS))
    if ca == "--ca=1"
        in_ket_qua([1, 2, 2, 4], 2, ma_ca="A01", ten_ca="VD01 - Vi du 1 tren phieu de")
    elseif ca == "--ca=2"
        in_ket_qua([1, 2, 2, 4], 5, ma_ca="A02", ten_ca="VD02 - Vi du 2 tren phieu de")
    elseif ca == "--ca=3"
        in_ket_qua([1, 3, 3, 3, 5, 7, 9], 3, ma_ca="A03", ten_ca="TK01 - Ca tu thiet ke (Trung khoa)")
    elseif ca == "--ca=4"
        in_ket_qua([-10, -5, -2, 0, 3, 8], -2, ma_ca="A04", ten_ca="TK02 - Ca tu thiet ke (So nguyen am)")
    elseif ca == "--ca=5"
        in_ket_qua([1, 2, 2, 4], 0, ma_ca="A05", ten_ca="BIEN01 - Ca bien (x nho hon moi phan tu)")
    elseif ca == "--ca=6"
        in_ket_qua(Int[], 2, ma_ca="A06", ten_ca="BIEN02 - Ca bien (Mang rong)")
    elseif ca == "--ca=7"
        in_ket_qua([5], 5, ma_ca="A07", ten_ca="BIEN03 - Ca bien (Mang 1 phan tu)")
    elseif ca == "--ca=8"
        minh_hoa_du_lieu_sai()
    elseif ca == "--ca=9"
        minh_hoa_kt09()
    elseif ca == "--ca=10"
        minh_hoa_kt10()
    elseif ca == "--ca=11"
        minh_hoa_kt11()
    elseif ca == "--ca=12"
        minh_hoa_kt12()
    else
        throw(ArgumentError("Lua chon khong hop le. Chon tu --ca=1 den --ca=12"))
    end
else
    in_ket_qua([1, 2, 2, 4], 2, ma_ca="A01", ten_ca="VD01 - Vi du 1 tren phieu de")
    println("\n--- VI DU 2: X LON HON MOI PHAN TU ---")
    in_ket_qua([1, 2, 2, 4], 5, ma_ca="A02", ten_ca="VD02 - Vi du 2 tren phieu de")
end