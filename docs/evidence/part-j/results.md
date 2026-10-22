
# SEN 305 — Lab Session 2
## Part J: MVT Flow Verification

### Experiment 1: TemplateDoesNotExist

**Change made:** Renamed `home.html` to `home2.html`.

**Expected error:** TemplateDoesNotExist

**Actual error:** [Record the error displayed]

**HTTP status:** [Record status]

**Cause:** Django could not find `core/home.html`.

**Solution:** Renamed the file back to `home.html`.

**Verification:** [Record the result after restoring the file]

---

### Experiment 2: NoReverseMatch

**Change made:** Changed `core:about` to `core:about_us` in `base.html`.

**Expected error:** NoReverseMatch

**Actual error:** [Record the error displayed]

**Cause:** The named URL `core:about_us` does not exist.

**Solution:** Restored `core:about`.

**Verification:** [Record the result]

---

### Experiment 3: AttributeError

**Change made:** Changed `views.home` to `views.hom` in `core/urls.py`.

**Expected error:** AttributeError

**Actual error:** [Record the error displayed]

**Cause:** The `hom` function does not exist in `core/views.py`.

**Solution:** Restored `views.home`.

**Verification:** [Record the result]

---

### Experiment 4: CSS 404

**Change made:** Changed `styles.css` to `style.css` in `base.html`.

**Expected error:** HTTP 404 for the stylesheet.

**Actual HTTP status:** [Record status]

**Cause:** The browser requested a CSS file that does not exist.

**Solution:** Restored `styles.css`.

**Verification:** [Record the result]

---

## Final Verification

Django system check: [Result]

Django tests: [Result]

Home page HTTP status: [Status]

About page HTTP status: [Status]

CSS HTTP status: [Status]
