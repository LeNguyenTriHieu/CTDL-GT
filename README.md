# [MÃ ĐỀ TÀI] — [TÊN ĐỀ TÀI ĐƯỢC GIAO]

**Khung chưa có thuật toán và chưa có test đạt.** Các lệnh demo/test hiện dừng ở
lỗi TODO có chủ đích. Không ghi “đã hoàn thành”, “Pass” hoặc dùng số kiểm tra của
mẫu BFS cho đề tài của mình. Chỉ hoàn thành sau khi thay đúng logic và tự chạy.

## Thông tin và căn cứ

- Họ tên, MSSV, lớp: `[ĐIỀN]`.
- Mã và tên đề tài đúng trong danh sách: `[ĐIỀN]`.
- Giáo trình: `Giao-trinh-Cau-truc-du-lieu-va-Giai-thuat-INT1306.pdf`.
- Chương, mục, bài tập, trang in và trang PDF đúng đề: `[ĐIỀN SAU KHI ĐỐI CHIẾU]`.
- URL GitHub thật: `[ĐIỀN]`; SHA chạy C ghi trong báo cáo và TXT nộp rời.
- Permalink tệp thuật toán tại C: ghi trong báo cáo/TXT; phiên bản Julia: `[ĐIỀN]`.

## Việc phải thay trước khi nộp

1. Đọc phiếu đề tài cá nhân và phần giáo trình liên quan. Không dùng BFS nếu đề
   không phải tìm đường ít cạnh nhất bằng BFS.
2. Viết hợp đồng input/output: kiểu, phạm vi, quy ước chỉ số, trường hợp đặc biệt
   và cách từ chối dữ liệu sai. Dữ liệu khai báo trực tiếp hoặc nhập bàn phím,
   không phụ thuộc CSV hay tệp dữ liệu bên ngoài.
3. Cài `src/DeTai.jl` bằng thuật toán của đề. Đổi tên module/tệp nếu cần và cập
   nhật `include` trong demo/test tương ứng. Giải thích từng cấu trúc dữ liệu.
4. Thay `du_lieu = nothing` ở `demo.jl`; in input và output rõ ràng. Chọn tám
   mục tiêu minh họa A01–A08 theo kế hoạch ảnh. Với miền chương trình chính nhỏ,
   dùng thêm ca hàm con/validator/bất biến đúng đề và giải thích đối tượng kiểm.
5. Thay lỗi TODO trong `test/runtests.jl` bằng ít nhất 12 ca có ID. Ghi đáp án
   kỳ vọng được tính độc lập, kiểm output/bất biến, có ca biên và input sai qua
   validator. Phân biệt số ca và số phép kiểm tra; cập nhật kết quả thật.
6. Tự chụp 11 ảnh A01–A11 theo `docs/anh_ket_qua/README.md`; chèn vào báo cáo có input,
   kỳ vọng, thực tế, phân tích và đường dẫn. Đồng bộ số hình với mục lục hình.
7. Điền đủ 5 chương, bảng kiểm thử, truy vết tay, độ phức tạp, so sánh và hạn
   chế theo mẫu báo cáo. Ghi phần đã sửa so với mã mẫu.

## Chạy sau khi đã cài đặt

Mở terminal tại thư mục repo:

```powershell
julia --version
julia --startup-file=no demo.jl
julia --startup-file=no test/runtests.jl
```

Lệnh thực tế, cấu trúc input và output của bài cá nhân: `[ĐIỀN]`.
Kết quả kiểm thử: `[ĐIỀN SỐ CA, SỐ PHÉP KIỂM TRA, ĐẠT/CHƯA ĐẠT THỰC TẾ]`.
Không đổi lỗi TODO thành `@test true` hoặc in “Pass” để thay cho kiểm thử.

## Công bố mã và kiểm tra bản clone

Tạo repo của mình trên GitHub. Thay `TEN_TAI_KHOAN`, `TEN_REPO` trước khi chạy:

```powershell
git init
git add README.md .gitignore src demo.jl test docs
git commit -m "Hoan thanh de tai va bang chung"
git branch -M main
git remote add origin https://github.com/TEN_TAI_KHOAN/TEN_REPO.git
git push -u origin main
git rev-parse HEAD
```

Clone vào thư mục mới chưa tồn tại rồi chạy lại:

```powershell
git clone https://github.com/TEN_TAI_KHOAN/TEN_REPO.git kiem_tra_ban_nop_MSSV
cd kiem_tra_ban_nop_MSSV
git rev-parse HEAD
julia --version
julia --startup-file=no demo.jl
julia --startup-file=no test/runtests.jl
```

Đây là lệnh hướng dẫn, chưa phải bằng chứng đã chạy. Chụp kết quả thật, ghi URL
repo và commit vào báo cáo. Trên GitHub mở tệp thuật toán, nhấn `y`, sao chép
permalink theo commit. Nếu repo riêng tư, cấp quyền giảng viên trước hạn nộp.
Không đưa token/mật khẩu vào repo hoặc báo cáo.

## Quy ước nộp Classroom

Báo cáo ghi SHA C của mã/test/input dùng tạo kết quả và permalink tại C. Sau khi thêm ảnh/báo cáo, chốt SHA S rồi ghi S trong ThongTinNop.txt nộp rời trên Classroom. Không đưa hash của chính commit vào tệp thuộc commit đó. Nộp đủ Word, PDF, ZIP mã và TXT đúng tên theo `00_HUONG_DAN_SINH_VIEN.html` trong gói phát cho lớp.
