export default defineNuxtRouteMiddleware(async (to) => {
    if (!to.path.startsWith('/admin')) return

    const { data: user } = await useFetch('/api/me')

    if (!user.value) {
        return navigateTo('/login')
    }

    if (user.value.rolle !== 'admin') {
        return navigateTo('/')
    }
})