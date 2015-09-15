(ns clj-test.core) 

(use 'clojure.contrib.math)

(def d (memoize (fn [S n]
  (if (zero? n)
    1
    (/
     (- S (expt (m S n) 2))
     (d S ( dec n)))))))

(def m (memoize (fn [S n]
  (if (zero? n)
    0
    (- 
      (* (d S (dec n)) (a S (dec n))) 
      (m S (dec n)))))))

(def a (memoize (fn [S n]
  (int 
    (if (zero? n)
      (sqrt S)
      (/ 
        (+ (a S 0) (m S n)) 
        (d S n)))))))

(defn find-period-length
  ([S] (find-period-length S {} 0))
  ([S res n]
  (let [t [(a S n) (m S n) (d S n)]]
    (if (res t)
      (dec n)
      (recur S
             (assoc res t true)
             (inc n))))))

(defn irrational? [n]
  (not (integer? (sqrt n))))

(count 
  (filter odd?
          (map find-period-length 
               (filter irrational? (range 2 10000)))))
