FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache curl

USER node
EXPOSE 5678

CMD ["n8n", "start"]
```

10. Click **Commit new file**.

---

## PART 3 — Deploy on Render

**Goal:** Connect GitHub to Render and launch n8n with your Supabase database.

1. Go to [render.com](https://render.com) and sign up using your GitHub account.
2. From the Render dashboard, click **New → Web Service**.
3. Click **Connect a repository** and select your `n8n-render` repo. Click **Connect**.
4. Fill in the settings:
   - **Name:** `n8n` (or anything you like)
   - **Region:** Same region as your Supabase project
   - **Branch:** `main`
   - **Runtime:** Docker (it should auto-detect from your Dockerfile)
   - **Plan:** Free

5. Scroll down to **Environment Variables** and add the following one by one:

| Key | Value |
|---|---|
| `DB_POSTGRESDB_HOST` | aws-0-us-west-2.pooler.supabase.com |
| `DB_POSTGRESDB_PASSWORD` | passSUPword92! |
| `N8N_ENCRYPTION_KEY` | 432739c82b88959513cf685f7b693b08d14b3a5c6b86e2a80a04ce2232f48793 |
| `N8N_USER_MANAGEMENT_JWT_SECRET` | 432739c82b88959513cf685f7b693b08d14b3a5c6b86e2a80a04ce2232f48793 |
| `N8N_HOST` | n8n.onrender.com |
| `WEBHOOK_URL` | https://n8n.onrender.com/ |

6. Click **Create Web Service**.

Render will now pull your GitHub repo, build the Docker image, and start n8n. This takes **3–5 minutes**.

---

## PART 4 — Final Configuration (After Deploy)

**Goal:** Tell n8n its own public URL so webhooks work correctly.

1. Once Render shows **Live** (green), copy your app URL at the top — it looks like:
```
   https://n8n.onrender.com
