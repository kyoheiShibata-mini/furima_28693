class GenreDispatch < ActiveHash::Base
  self.data = [
    { id: "", name: '---' },
    { id: 1, name: '１〜２日で発送' },
    { id: 2, name: '２〜３日で発送' },
    { id: 3, name: '４〜７日で発送' }
  ]
end