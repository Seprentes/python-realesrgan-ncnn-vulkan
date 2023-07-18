
# deprecated cimport for backwards compatibility:
from libc.string cimport const_char

cdef extern from "<string>" namespace "std::string" nogil:
    const size_t npos

cdef extern from "<string>" namespace "std" nogil:
    cdef cppclass wstring:

        cppclass iterator:
            iterator()
            char& operator*()
            iterator(iterator&)
            iterator operator++()
            iterator operator--()
            bint operator==(iterator)
            bint operator!=(iterator)

        cppclass reverse_iterator:
            char& operator*()
            iterator operator++()
            iterator operator--()
            iterator operator+(size_t)
            iterator operator-(size_t)
            bint operator==(reverse_iterator)
            bint operator!=(reverse_iterator)
            bint operator<(reverse_iterator)
            bint operator>(reverse_iterator)
            bint operator<=(reverse_iterator)
            bint operator>=(reverse_iterator)

        cppclass const_iterator(iterator):
            pass

        cppclass const_reverse_iterator(reverse_iterator):
            pass

        wstring() except +
        wstring(const string& s) except +
        wstring(const string& s, size_t pos) except +
        wstring(const string& s, size_t pos, size_t len) except +
        wstring(const char* s) except +
        wstring(const char* s, size_t n) except +
        wstring(size_t n, char c) except +
        wstring(iterator first, iterator last) except +

        iterator begin()
        const_iterator const_begin "begin"()
        iterator end()
        const_iterator const_end "end"()
        reverse_iterator rbegin()
        const_reverse_iterator const_rbegin "rbegin"()
        reverse_iterator rend()
        const_reverse_iterator const_rend "rend"()

        const char* c_str()
        const char* data()
        size_t size()
        size_t max_size()
        size_t length()
        void resize(size_t) except +
        void resize(size_t, char) except +
        void shrink_to_fit() except +
        size_t capacity()
        void reserve(size_t) except +
        void clear()
        bint empty()

        iterator erase(iterator first, iterator last)
        iterator erase(iterator p)
        iterator erase(const_iterator first, const_iterator last)
        iterator erase(const_iterator p)
        wstring& erase(size_t pos, size_t len) except +
        wstring& erase(size_t pos) except +
        wstring& erase() except +

        char& at(size_t pos) except +
        char& operator[](size_t pos)
        char& front()
        char& back()
        int compare(const wstring& s)
        int compare(size_t pos, size_t len, const wstring& s) except +
        int compare(size_t pos, size_t len, const wstring& s, size_t subpos, size_t sublen) except +
        int compare(const char* s) except +
        int compare(size_t pos, size_t len, const char* s) except +
        int compare(size_t pos, size_t len, const char* s , size_t n) except +

        wstring& append(const wstring& s) except +
        wstring& append(const wstring& s, size_t subpos, size_t sublen) except +
        wstring& append(const char* s) except +
        wstring& append(const char* s, size_t n) except +
        wstring& append(size_t n, char c) except +

        void push_back(char c) except +
        void pop_back()

        wstring& assign(const wstring& s) except +
        wstring& assign(const wstring& s, size_t subpos, size_t sublen) except +
        wstring& assign(const char* s, size_t n) except +
        wstring& assign(const char* s) except +
        wstring& assign(size_t n, char c) except +

        wstring& insert(size_t pos, const wstring& s, size_t subpos, size_t sublen) except +
        wstring& insert(size_t pos, const wstring& s) except +
        wstring& insert(size_t pos, const char* s, size_t n) except +
        wstring& insert(size_t pos, const char* s) except +
        wstring& insert(size_t pos, size_t n, char c) except +
        void insert(iterator p, size_t n, char c) except +
        iterator insert(iterator p, char c) except +

        size_t copy(char* s, size_t len, size_t pos) except +
        size_t copy(char* s, size_t len) except +

        size_t find(const wstring& s, size_t pos)
        size_t find(const wstring& s)
        size_t find(const char* s, size_t pos, size_t n)
        size_t find(const char* s, size_t pos)
        size_t find(const char* s)
        size_t find(char c, size_t pos)
        size_t find(char c)

        size_t rfind(const wstring&, size_t pos)
        size_t rfind(const wstring&)
        size_t rfind(const char* s, size_t pos, size_t n)
        size_t rfind(const char* s, size_t pos)
        size_t rfind(const char* s)
        size_t rfind(char c, size_t pos)
        size_t rfind(char c)

        size_t find_first_of(const wstring&, size_t pos)
        size_t find_first_of(const wstring&)
        size_t find_first_of(const char* s, size_t pos, size_t n)
        size_t find_first_of(const char* s, size_t pos)
        size_t find_first_of(const char* s)
        size_t find_first_of(char c, size_t pos)
        size_t find_first_of(char c)

        size_t find_first_not_of(const wstring& s, size_t pos)
        size_t find_first_not_of(const wstring& s)
        size_t find_first_not_of(const char* s, size_t pos, size_t n)
        size_t find_first_not_of(const char* s, size_t pos)
        size_t find_first_not_of(const char*)
        size_t find_first_not_of(char c, size_t pos)
        size_t find_first_not_of(char c)

        size_t find_last_of(const wstring& s, size_t pos)
        size_t find_last_of(const wstring& s)
        size_t find_last_of(const char* s, size_t pos, size_t n)
        size_t find_last_of(const char* s, size_t pos)
        size_t find_last_of(const char* s)
        size_t find_last_of(char c, size_t pos)
        size_t find_last_of(char c)

        size_t find_last_not_of(const wstring& s, size_t pos)
        size_t find_last_not_of(const wstring& s)
        size_t find_last_not_of(const char* s, size_t pos, size_t n)
        size_t find_last_not_of(const char* s, size_t pos)
        size_t find_last_not_of(const char* s)
        size_t find_last_not_of(char c, size_t pos)
        size_t find_last_not_of(char c)

        wstring substr(size_t pos, size_t len) except +
        wstring substr(size_t pos) except +
        wstring substr()

        wstring operator+ (const wstring&) except +
        wstring operator+ (const char*) except +

        bint operator==(const wstring&)
        bint operator==(const char*)

        bint operator!= (const wstring&)
        bint operator!= (const char*)

        bint operator< (const wstring&)
        bint operator< (const char*)

        bint operator> (const wstring&)
        bint operator> (const char*)

        bint operator<= (const wstring&)
        bint operator<= (const char*)

        bint operator>= (const wstring&)
        bint operator>= (const char*)


    wstring to_string(int val) except +
    wstring to_string(long val) except +
    wstring to_string(long long val) except +
    wstring to_string(unsigned val) except +
    wstring to_string(size_t val) except +
    wstring to_string(ssize_t val) except +
    wstring to_string(unsigned long val) except +
    wstring to_string(unsigned long long val) except +
    wstring to_string(float val) except +
    wstring to_string(double val) except +
    wstring to_string(long double val) except +

    int stoi(const wstring& s, size_t* idx, int base) except +
    int stoi(const wstring& s, size_t* idx) except +
    int stoi(const wstring& s) except +
    long stol(const wstring& s, size_t* idx, int base) except +
    long stol(const wstring& s, size_t* idx) except +
    long stol(const wstring& s) except +
    long long stoll(const wstring& s, size_t* idx, int base) except +
    long long stoll(const wstring& s, size_t* idx) except +
    long long stoll(const wstring& s) except +

    unsigned long stoul(const wstring& s, size_t* idx, int base) except +
    unsigned long stoul(const wstring& s, size_t* idx) except +
    unsigned long stoul(const wstring& s) except +
    unsigned long long stoull(const wstring& s, size_t* idx, int base) except +
    unsigned long long stoull(const wstring& s, size_t* idx) except +
    unsigned long long stoull(const wstring& s) except +

    float stof(const wstring& s, size_t* idx) except +
    float stof(const wstring& s) except +
    double stod(const wstring& s, size_t* idx) except +
    double stod(const wstring& s) except +
    long double stold(const wstring& s, size_t* idx) except +
    long double stold(const wstring& s) except +
