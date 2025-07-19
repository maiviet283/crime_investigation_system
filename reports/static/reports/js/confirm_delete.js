const deleteButtons = document.querySelectorAll('.delete-btn');
const modal = document.getElementById('deleteModal');
const cancelBtn = document.querySelector('.cancel-btn');
const deleteForm = document.getElementById('deleteForm');

deleteButtons.forEach(btn => {
    btn.addEventListener('click', function (e) {
        e.preventDefault();
        const id = this.dataset.id;
        deleteForm.action = "{% url 'reports:delete-information-protection' 0 %}".replace('/0', `/${id}`);
        modal.style.display = 'flex';
    });
});


cancelBtn.addEventListener('click', function () {
    modal.style.display = 'none';
});

window.onclick = function (e) {
    if (e.target === modal) {
        modal.style.display = 'none';
    }
}