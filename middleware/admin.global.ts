export default defineNuxtRouteMiddleware(async (to) => {
    if (!to.path.startsWith('/admin')) return

    console.log('ADMIN CHECK')

    try {
        const user = await $fetch('/api/auth/me')

        console.log('USER:', user)

        if (user.rolle !== 'admin') {
            return navigateTo('/')
        }
    } catch (e) {
        console.log('NOT LOGGED IN')
        return navigateTo('/login')
    }
})