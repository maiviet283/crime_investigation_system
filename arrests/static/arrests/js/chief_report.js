$(document).ready(function () {
    $('#investigationTable').DataTable({
        pageLength: 10,
        lengthMenu: [5, 10, 20],
        language: {
            search: "",
            searchPlaceholder: "Search...",
            lengthMenu: "Show _MENU_ entries",
            paginate: {
                previous: "Previous",
                next: "Next"
            }
        },
        dom: `<'row mb-3'
                <'col-md-6 d-flex align-items-center'l>
                <'col-md-6 text-end'f>
            >
            <'row'
                <'col-12'tr>
            >
            <'row mt-3'
                <'col-md-12 d-flex justify-content-center'p>
            >`
    });

    // Mở rộng ô tìm kiếm
    $('.dataTables_filter input').addClass('form-control ms-2').css({
        width: '100%',
        maxWidth: '400px',
        display: 'inline-block'
    });
});
