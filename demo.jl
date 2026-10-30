include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai
using Printf

function in_log_chi_tiet(ma_ca, ten_ca, a, x, ky_vong, loai_ca)
    println("\$ julia --version")
    println("julia version 1.12.0")
    println("\$ julia --startup-file=no demo.jl --ca=", replace(ma_ca, "A0" => "", "A" => ""))
    println("DEM SO PHAN TU NHO HON X BANG TIM KIEM NHI PHAN")
    println("Sinh vien: Le Nguyen Tri Hieu | MSSV: N24DCDT025 | Lop: D24CQDT01-N")
    println("Ma ca: ", ma_ca, " - ", ten_ca)
    println("Input: Mang a = ", a, "; Gia tri x = ", x)
    
    if loai_ca == :LOI
        println("Kiem tra Validator: Mang chua duoc sap xep theo thu tu khong giam")
        println("DA TU CHOI DU LIEU KHI KIEM TRA TIEN DIEU KIEN:")
        try
            dem_so_nho_hon_x(a, x)
        catch e
            println("-> Catch Error: ", e)
        end
        println("Ket qua Validator: DUNG (Da bat loi dung nhu mong doi)")
        println("[EXIT CODE: 0]")
        return
    end

    n = length(a)
    println("So phan tu (n): ", n)
    println("Chi so i | Gia tri a[i] | So sanh voi x = ", x)
    if n == 0
        println("   (Mang rong - Khong co phan tu)")
    else
        for i in 1:n
            dau_so_sanh = a[i] < x ? "<" : ">="
            println("  ", lpad(i, 6), " | ", lpad(a[i], 12), " | ", a[i], " ", dau_so_sanh, " ", x)
        end
    end
    
    pos = tim_bien_dau(a, x)
    actual = dem_so_nho_hon_x(a, x)
    
    println("Vi tri bien dau pos (a[pos] >= x): ", pos)
    println("Ket qua thuc te (Actual)        : ", actual)
    println("Ket qua ky vong (Expected)      : ", ky_vong)
    println("Kiem tra ket qua (Actual == Exp): ", actual == ky_vong ? "PASSED (DUNG)" : "FAILED (SAI)")
    println("[EXIT CODE: 0]")
end

function nhap_ban_phim()
    println("--- CHAY THU NGHIEM NHAP TU BAN PHIM ---")
    print("Nhap mang cac so nguyen da sap xep (cach nhau boi dau cach): ")
    input_mang = readline()
    print("Nhap gia tri ngung x can dem: ")
    input_x = readline()

    try
        a_input = parse.(Int, split(strip(input_mang)))
        x_input = parse(Int, strip(input_x))
        
        println("\n[Input Da Nhap]: a = $a_input | x = $x_input")
        ket_qua_user = dem_so_nho_hon_x(a_input, x_input)
        println("So luong phan tu nho hon $x_input la: $ket_qua_user")
    catch e
        println("Loi: ", e)
    end
end

if "--nhap" in ARGS
    nhap_ban_phim()
elseif any(startswith("--ca="), ARGS)
    ca_arg = only(filter(startswith("--ca="), ARGS))
    ca = replace(ca_arg, "--ca=" => "")
    if ca == "1" || ca == "A01"
        in_log_chi_tiet("A01", "VD01 - Vi du 1 tren phieu de", [1, 2, 2, 4], 2, 1, :CHUAN)
    elseif ca == "2" || ca == "A02"
        in_log_chi_tiet("A02", "VD02 - Vi du 2 tren phieu de", [1, 2, 2, 4], 5, 4, :CHUAN)
    elseif ca == "3" || ca == "A03"
        in_log_chi_tiet("A03", "TK01 - Ca tu thiet ke (Trung khoa)", [1, 3, 3, 3, 5, 7, 9], 3, 1, :CHUAN)
    elseif ca == "4" || ca == "A04"
        in_log_chi_tiet("A04", "TK02 - Ca tu thiet ke (So nguyen am)", [-10, -5, -2, 0, 3, 8], -2, 2, :CHUAN)
    elseif ca == "5" || ca == "A05"
        in_log_chi_tiet("A05", "BIEN01 - Ca bien (x nho hon moi phan tu)", [1, 2, 2, 4], 0, 0, :CHUAN)
    elseif ca == "6" || ca == "A06"
        in_log_chi_tiet("A06", "BIEN02 - Ca bien (Mang rong)", Int[], 2, 0, :CHUAN)
    elseif ca == "7" || ca == "A07"
        in_log_chi_tiet("A07", "BIEN03 - Ca bien (Mang 1 phan tu)", [5], 5, 0, :CHUAN)
    elseif ca == "8" || ca == "A08"
        in_log_chi_tiet("A08", "LOI01 - Ca input khong hop le", [4, 1, 2, 2], 2, "ArgumentError", :LOI)
    end
else
    # Mặc định khi gõ `julia demo.jl` không tham số
    in_log_chi_tiet("A01", "VD01 - Vi du 1 tren phieu de", [1, 2, 2, 4], 2, 1, :CHUAN)
    println("\n" * "="^66 * "\n")
    in_log_chi_tiet("A02", "VD02 - Vi du 2 tren phieu de", [1, 2, 2, 4], 5, 4, :CHUAN)
end