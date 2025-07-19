from django.core.files.storage import default_storage

def handle_uploaded_files(files, subfolder):
    """
    Lưu các file upload vào media/file/<subfolder>/ và trả về danh sách đường dẫn.
    :param files: list các file (request.FILES.getlist)
    :param subfolder: tên thư mục con, ví dụ 'party' hoặc 'evidence'
    :return: list đường dẫn file đã lưu
    """
    saved_paths = []
    for f in files:
        file_path = default_storage.save(f'file/{subfolder}/{f.name}', f)
        saved_paths.append(file_path)
    return saved_paths