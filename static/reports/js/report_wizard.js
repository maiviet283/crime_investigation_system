// Relevant Party Modal JS
const partyForm = document.getElementById('relevantPartyForm');
const createPartyBtn = document.getElementById('createPartyBtn');
if (partyForm && createPartyBtn) {
  createPartyBtn.onclick = function() {
    const fullname = partyForm.fullname.value.trim();
    const relationship = partyForm.relationship.value;
    if (!fullname || !relationship) {
      alert('Please fill in all required fields!');
      return;
    }
    // Lưu DB qua AJAX
    const formData = new FormData(partyForm);
    fetch(window.add_party_url, {
      method: 'POST',
      body: formData,
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Party added successfully!');
        const modal = bootstrap.Modal.getInstance(document.getElementById('relevantPartyModal'));
        if (modal) modal.hide();
        partyForm.reset();
        document.getElementById('uploaded-files').innerHTML = '';
        setTimeout(() => { window.location.reload(); }, 500); // Sử dụng window.location
      } else {
        alert('Error adding party: ' + (data.error || 'Unknown error'));
      }
    })
    .catch(error => {
      alert('An error occurred while adding the party. Please try again.');
    });
  };
}
document.getElementById('cancelPartyBtn').onclick = function() {
  partyForm.reset();
  document.getElementById('uploaded-files').innerHTML = '';
};

// Evidence Modal JS
const evidenceForm = document.getElementById('evidenceForm');
const createEvidenceBtn = document.getElementById('createEvidenceBtn');
if (evidenceForm && createEvidenceBtn) {
  createEvidenceBtn.onclick = function() {
    const evidenceType = evidenceForm.evidence_type.value;
    const evidenceLocation = evidenceForm.location.value.trim(); // Đổi tên biến để tránh conflict
    if (!evidenceType || !evidenceLocation) {
      alert('Please fill in all required fields!');
      return;
    }
    // Lưu DB qua AJAX
    const formData = new FormData(evidenceForm);
    fetch(window.add_evidence_url, {
      method: 'POST',
      body: formData,
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Evidence added successfully!');
        const modal = bootstrap.Modal.getInstance(document.getElementById('evidenceModal'));
        if (modal) modal.hide();
        evidenceForm.reset();
        document.getElementById('evidence-uploaded-files').innerHTML = '';
        setTimeout(() => {window.location.reload();}, 500);
      } else {
        alert('Error adding evidence: ' + (data.error || 'Unknown error'));
      }
    })
    .catch(error => {
      alert('An error occurred while adding the evidence. Please try again.');
    });
  };
}
document.getElementById('evidenceModal').addEventListener('hidden.bs.modal', function() {
  evidenceForm.reset();
  document.getElementById('evidence-uploaded-files').innerHTML = '';
});
// Preview file for relevant parties
const partyFileInput = document.getElementById('party-attachments');
const partyPreviewDiv = document.getElementById('uploaded-files');
if (partyFileInput && partyPreviewDiv) {
  partyFileInput.addEventListener('change', function() {
    partyPreviewDiv.innerHTML = '';
    for (const file of partyFileInput.files) {
      const fileDiv = document.createElement('div');
      fileDiv.className = 'me-2 mb-2';
      // Ảnh
      if (file.type.startsWith('image/')) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.style.maxWidth = '80px';
        img.style.maxHeight = '80px';
        img.onload = () => URL.revokeObjectURL(img.src);
        fileDiv.appendChild(img);
      } else {
        // File khác: chỉ hiện tên
        const icon = document.createElement('i');
        icon.className = 'fa fa-file me-1';
        fileDiv.appendChild(icon);
        fileDiv.appendChild(document.createTextNode(file.name));
      }
      partyPreviewDiv.appendChild(fileDiv);
    }
  });
}

// Preview file for evidence
const evidenceFileInput = document.getElementById('evidence-attachments');
const evidencePreviewDiv = document.getElementById('evidence-uploaded-files');
if (evidenceFileInput && evidencePreviewDiv) {
  evidenceFileInput.addEventListener('change', function() {
    evidencePreviewDiv.innerHTML = '';
    for (const file of evidenceFileInput.files) {
      const fileDiv = document.createElement('div');
      fileDiv.className = 'me-2 mb-2';
      if (file.type.startsWith('image/')) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.style.maxWidth = '80px';
        img.style.maxHeight = '80px';
        img.onload = () => URL.revokeObjectURL(img.src);
        fileDiv.appendChild(img);
      } else {
        const icon = document.createElement('i');
        icon.className = 'fa fa-file me-1';
        fileDiv.appendChild(icon);
        fileDiv.appendChild(document.createTextNode(file.name));
      }
      evidencePreviewDiv.appendChild(fileDiv);
    }
  });
}
let partyToDeleteId = null;
let evidenceToDeleteId = null;

// Party delete handler
document.querySelectorAll('.delete-party-btn').forEach(button => {
  button.addEventListener('click', function (e) {
    e.preventDefault();
    partyToDeleteId = this.getAttribute('data-id');
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteConfirmModal'));
    deleteModal.show();
  });
});

document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
  if (partyToDeleteId) {
    fetch(`/reports/delete_party/${partyToDeleteId}/`, {
      method: 'POST',
      headers: {
        'X-CSRFToken': window.csrfToken,
      }
    })
    .then(response => {
      if (response.ok) {
        location.reload();
      } else {
        alert('Delete failed.');
      }
    });
  }
});

// Evidence delete handler
document.querySelectorAll('.delete-evidence-btn').forEach(button => {
  button.addEventListener('click', function (e) {
    e.preventDefault();
    evidenceToDeleteId = this.getAttribute('data-id');
    const deleteModal = new bootstrap.Modal(document.getElementById('deleteConfirmEvidenceModal'));
    deleteModal.show();
  });
});

document.getElementById('confirmDeleteEvidenceBtn').addEventListener('click', function () {
  if (evidenceToDeleteId) {
    fetch(`/reports/delete_evidence/${evidenceToDeleteId}/`, {
      method: 'POST',
      headers: {
        'X-CSRFToken': window.csrfToken,
      }
    })
    .then(response => {
      if (response.ok) {
        location.reload();
      } else {
        alert('Delete failed.');
      }
    });
  }
});
