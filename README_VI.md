# DENBROWN AI PHOTO FREE

Bản MVP không cần OpenAI API, không cần Google Drive, không cần database hay tài khoản riêng.

## Tính năng
- Website responsive cho iPhone, Android, Windows, Mac.
- Chọn nhiều ảnh, sắp xếp lên/xuống, xóa ảnh, thêm chú thích.
- Tạo bố cục ghép 2 cột và tải JPG.
- Tạo prompt tiếng Việt theo bộ ảnh để sao chép sang ChatGPT Free.
- Nút mở https://chatgpt.com để người dùng tự tải ảnh lên và nhờ ChatGPT biên tập.
- Ảnh được xử lý cục bộ trong trình duyệt khi tạo trang ghép; website không tải ảnh lên máy chủ.

## Cách chạy nhanh trên iPhone
Để có website dùng ở mọi thiết bị, cách dễ nhất là tải tệp này lên GitHub rồi deploy Vercel:
1. Giải nén ZIP trong ứng dụng Tệp.
2. Mở https://github.com, đăng nhập và tạo repository `denbrown-ai-photo-free`.
3. Upload `index.html` và `README_VI.md` lên repository rồi Commit changes.
4. Mở https://vercel.com, đăng nhập bằng GitHub, Import repository và nhấn Deploy.
5. Mở URL `.vercel.app` trên điện thoại. Có thể chọn Chia sẻ → Thêm vào Màn hình chính.

Không cần tạo biến môi trường, API key, API route hay cấu hình cơ sở dữ liệu.

## Cách sử dụng
1. Nhập tên cặp đôi, chọn nghi lễ và phong cách.
2. Chọn ảnh cưới; đổi thứ tự và ghi chú nếu cần.
3. Nhấn `Tạo trang ghép ảnh` rồi tải JPG.
4. Nhấn `Tạo yêu cầu cho ChatGPT`, sao chép nội dung, mở ChatGPT Free, dán prompt và tự tải ảnh lên cuộc trò chuyện nếu muốn AI xem ảnh.

## Giới hạn
- ChatGPT Free không được nhúng trực tiếp trong website; người dùng chủ động mở ChatGPT và tải ảnh lên.
- Tính năng ghép hiện tạo contact sheet 2 cột, chưa phải phần mềm dàn trang album in.
- Ảnh và danh sách dự án chỉ ở phiên trình duyệt hiện tại, không lưu lâu dài. Tải kết quả xuống trước khi đóng hoặc làm mới trang.
- Mọi chính sách giới hạn sử dụng và khả năng tải ảnh của ChatGPT Free phụ thuộc OpenAI và có thể thay đổi.
