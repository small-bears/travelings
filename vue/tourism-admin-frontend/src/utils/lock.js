export function getLock() {
    var lock = window.localStorage.getItem("lock")
    if (lock == null) {
        lock = 1
    }
    return lock
}

export function setLock(lock) {
    return window.localStorage.setItem("lock",lock)
}