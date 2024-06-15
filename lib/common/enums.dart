// i'd love for dart to add rust-like enums, where arrer could have a string associated
// a generic freezed union would work well, but kinda overkill for this single use
enum Progress { initial, loading, error, success }
