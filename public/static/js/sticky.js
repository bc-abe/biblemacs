 function updateStickyH2() {
  const headings = document.querySelectorAll('h2');
  let mostRecentH2 = null;

  // Find the most recent h2 in the viewport
  headings.forEach(h2 => {
    const rect = h2.getBoundingClientRect();
    if (rect.top <= 0 && rect.bottom >= 0) {
      mostRecentH2 = h2;
    }
  });

  // Apply the sticky class to the most recent h2
  headings.forEach(h2 => h2.classList.remove('sticky'));
  if (mostRecentH2) {
    mostRecentH2.classList.add('sticky');
  }
}

// Update sticky h2 on page load
document.addEventListener('DOMContentLoaded', updateStickyH2);

// Update sticky h2 on scroll
document.addEventListener('scroll', updateStickyH2);

// Also update sticky h2 when resizing the window
window.addEventListener('resize', updateStickyH2);
