# Backend handoff — Awka Direct

## Roles
- `tenant`: browse public listings; create viewing requests only after a successful Google OAuth session.
- `landlord`: submit and manage their own property listings and room options.
- `caretaker`: submit and manage listings they are authorised to manage.
- `admin`: review listings, manage reports, and manage accounts. Admin permissions must be assigned securely, never by a public role selector.

## Suggested tables
- `profiles`: `id` (auth user UUID), `full_name`, `email`, `phone`, `role`, `google_verified_at`, `account_status`, `avatar_path`, `created_at`, `updated_at`.
- `properties`: `id`, `owner_id`, `title`, `property_type`, `area`, `address_or_directions`, `description`, `annual_rent`, `other_charges`, `bedrooms`, `bathrooms`, `availability`, `listing_status`, `verification_status`, `reviewed_by`, `reviewed_at`, timestamps.
- `property_rooms`: `id`, `property_id`, `room_name`, `annual_rent`, `available_count`, `features`.
- `property_media`: `id`, `property_id`, `room_id` nullable, `storage_path`, `media_type`, `caption`, `sort_order`.
- `viewing_requests`: `id`, `property_id`, `tenant_id`, `preferred_date`, `preferred_time`, `message`, `status`, timestamps.
- `property_reports`: `id`, `property_id`, `reporter_id`, `reason`, `details`, `status`, `reviewed_by`, `reviewed_at`, timestamps.
- `admin_audit_log`: `id`, `admin_id`, `action`, `entity_type`, `entity_id`, `notes`, `created_at`.

## Storage buckets
- `property-photos`: listing images.
- `room-photos`: sample room images.
- `profile-photos`: profile pictures.
- `property-documents`: supporting files; private by default and visible only to the listing owner and authorised admins.

## Required access rules
- Public visitors can read only published listings and their public room/price details.
- Tenants must have a validated Google OAuth session before creating viewing requests.
- Landlords/caretakers can insert and update only listings they own/manage. New or edited listings should return to `pending_review`.
- Only admins can approve/reject listings, resolve reports, or suspend/reactivate accounts.
- Never store Google access tokens or raw credentials in `localStorage`.
- Keep uploaded documents private, validate file MIME type/size server-side, and use signed URLs when appropriate.
- A Google OAuth login confirms control of a Google account; it does not verify property ownership or authority to let.
