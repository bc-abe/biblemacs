// Base URL (adjust local path)
const BASE_URL = window.location.hostname === "abepeters.com" 
    ? "https://abepeters.com/bible/"
    : "./";  // Current directory (bible folder)

let modalCreated = false;

// Function to create and show the modal
function createAndShowBibleModal() {
    // Only create modal once
    if (!modalCreated) {
        const modalHTML = `
        <div id="bibleModal" style="
            display:none;
            position:fixed;
            top:0; left:0; right:0; bottom:0;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(3px);
            z-index:10000;
            display:flex;
            align-items:center;
            justify-content:center;
        ">
            <div style="
                background:#1a1a1a;
                padding:30px;
                border-radius:12px;
                box-shadow:0 10px 30px rgba(0,0,0,0.5);
                color:#f5fff5;
                min-width:300px;
                max-width:400px;
                font-family:sans-serif;
                display:flex;
                flex-direction:column;
                gap:15px;
            ">
                <h2 style="margin:0; font-size:1.2em;">Go to Bible Reference</h2>
                <input id="bibleInput" type="text" placeholder="Acts, Acts 2, Acts 2:38" style="
                    padding:10px;
                    border:none;
                    border-radius:6px;
                    font-size:1em;
                    width:100%;
                ">
                <div style="display:flex; justify-content:flex-end; gap:10px;">
                    <button id="bibleCancel" style="
                        padding:8px 15px;
                        border:none;
                        border-radius:6px;
                        background:#444;
                        color:#f5fff5;
                        cursor:pointer;
                    ">Cancel</button>
                    <button id="bibleGo" style="
                        padding:8px 15px;
                        border:none;
                        border-radius:6px;
                        background:#4CAF50;
                        color:white;
                        font-weight:bold;
                        cursor:pointer;
                    ">Go</button>
                </div>
            </div>
        </div>
        `;
        document.body.insertAdjacentHTML('beforeend', modalHTML);
        
        // Set up event listeners (only once)
        const modal = document.getElementById('bibleModal');
        const input = document.getElementById('bibleInput');
        const btnGo = document.getElementById('bibleGo');
        const btnCancel = document.getElementById('bibleCancel');
        
        // Close modal
        btnCancel.addEventListener('click', () => modal.style.display = 'none');
        document.addEventListener('keydown', (e) => {
            if (e.key === "Escape") modal.style.display = 'none';
        });
        
        // Press Enter to go
        input.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') btnGo.click();
        });
        
        // Go button logic
        btnGo.addEventListener('click', () => {
            const value = input.value.trim();
            if (!value) return;
            const parts = value.split(/\s+/);
            const book = parts[0];
            let chapter = null;
            let verse = null;
            if (parts.length > 1) {
                if (parts[1].includes(':')) {
                    [chapter, verse] = parts[1].split(':');
                } else {
                    chapter = parts[1];
                }
            }
            let url = `${BASE_URL}${book}.html`;
            if (chapter && verse) {
                // Navigate to specific verse (e.g., #1-2)
                url += `#${chapter}-${verse}`;
            } else if (chapter) {
                // Navigate to first verse of chapter (e.g., #1-1)
                url += `#${chapter}-1`;
            }
            // Navigate in same tab
            window.location.href = url;
            modal.style.display = 'none';
        });
        
        modalCreated = true;
    }
    
    // Show modal and focus input
    const modal = document.getElementById('bibleModal');
    const input = document.getElementById('bibleInput');
    modal.style.display = 'flex';
    input.value = '';
    input.focus();
}

// Listen for hotkey (Ctrl+Shift+F)
document.addEventListener('keydown', (event) => {
    if (event.ctrlKey && event.shiftKey && event.code === 'KeyF') {
        event.preventDefault();
        createAndShowBibleModal();
    }
});
