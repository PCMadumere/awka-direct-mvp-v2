# Awka Direct — Frontend MVP

A simplified, responsive frontend prototype for an Awka, Anambra State rental marketplace. It is intentionally limited to the core MVP screens and uses larger text and controls.

## Run it

1. Extract the ZIP.
2. Open the folder in VS Code.
3. Run `python -m http.server 8000` from this folder, or use VS Code Live Server.
4. Open `http://localhost:8000`.
5. Public marketplace: `index.html` · Registration: `account.html` · Dashboard preview: `dashboard.html?role=admin`.

## Included screens

- Public property search, filters, property detail, favourites, report listing, and viewing request.
- Registration/sign-in demo with Tenant, Landlord, and Caretaker roles. There is no Agent role.
- Tenant dashboard, saved homes, viewing requests, and profile.
- Landlord/caretaker property management, room-type inventory, image/file selection, profile picture, and profile.
- Admin overview, property review with approve/reject, reports with resolve/dismiss/reopen, and user suspend/reactivate.

## MVP rules

- Google is the only planned verification provider. The Google button is simulated in this frontend and is not real OAuth.
- Users may skip verification. The account is marked Not verified.
- Unverified tenants can browse, but cannot submit a viewing request.
- Landlords and caretakers can submit properties and multiple room options without verification. Listings begin as Not verified / Pending review.
- Admin approval changes listing status in this browser demo; it does not prove ownership or authority to let.
- Photo and document inputs support local previews or file-name displays. Files are not uploaded to cloud storage.
- Demo state is stored in `localStorage` on the current browser only.

## Clear demo data

Open browser developer tools → Application/Storage → Local Storage for localhost, then delete keys beginning with `awkaV2`, or use a private browser window.

## Backend handoff

Suggested next step: connect Supabase Auth with Google OAuth, PostgreSQL tables for profiles/properties/rooms/viewing_requests/reports, Storage buckets for property images/room images/profile pictures/supporting documents, and row-level security. The admin role and all approval/suspension actions must be enforced server-side.
