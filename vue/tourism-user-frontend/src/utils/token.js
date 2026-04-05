export function getToken() {
    return window.localStorage.getItem("user_token")
}

export function removeToken() {
    return window.localStorage.removeItem("user_token")
}